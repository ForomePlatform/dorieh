#!/usr/bin/env cwl-runner
### Medicare data ingestion and processing pipeline
#  Copyright (c) 2022. Harvard University
#
#  Developed by Research Software Engineering,
#  Faculty of Arts and Sciences, Research Computing (FAS RC)
#  Author: Michael A Bouzinier
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

cwlVersion: v1.2
class: Workflow

requirements:
  SubworkflowFeatureRequirement: {}
  StepInputExpressionRequirement: {}
  InlineJavascriptRequirement: {}

doc: |
  This workflow processes raw Medicare data. We assume that the data
  for each year is in a separate set of SAS DAT files accompanied by FTS.
  For each year we expect at least
  two tables: patient summary and inpatient admissions.

  > NB: Input files must be organized within the dicrectory given in
  the `input` parameter in a certain way. Immediate parent folder for
  each file should be named as the year of the data it contains. Example:

      data/
        a/
          b/
            2011/
            2013/
          d/
            2017/

  See [](../Medicare) for data processing details.

inputs:
  database:
    type: File
    doc: Path to database connection file, usually database.ini
  connection_name:
    type: string
    doc: The name of the section in the database.ini file
  input:
    type: Directory
    doc: |
      A path to directory, containing folders with unpacked CMS
      files. The tool will recursively look for data files
      according to provided pattern. Immediate parent folder for
      each file should be named as the year of the data it contains, e.g.
      a/b/c/2017/mbsf_abcd_xyzacdfrtwe_request12345.fts

steps:
  initdb:
    run: initdb.cwl
    doc: Ensure that database utilities are at their latest version
    in:
      database: database
      connection_name: connection_name
    out:
      - log
      - err

  load_raw_data:
    run: load_raw_medicare.cwl
    doc: Load raw CMS Medicare data into the database
    in:
      database: database
      connection_name: connection_name
      depends_on: initdb/log
      input: input
    out:
      - log
      - registry
      - err

  enrollments:
    run: medicare_beneficiaries.cwl
    doc: >
      Process beneficiaries enrollment data
    in:
      database: database
      connection_name: connection_name
      depends_on: load_raw_data/registry
    out:
      - d_create_log
      - d_index_log
      - d_vacuum_log
      - d_create_err
      - d_index_err
      - d_vacuum_err
      - ps_create_log
      - ps_create_err
      - ps2_create_log
      - ps2_create_err
      - bene_view_log
      - bene_view_err
      - bene_table_create_log
      - bene_table_index_log
      - bene_table_vacuum_log
      - bene_table_create_err
      - bene_table_index_err
      - bene_table_vacuum_err
      - enrlm_view_log
      - enrlm_view_err
      - enrlm_table_create_log
      - enrlm_table_index_log
      - enrlm_table_vacuum_log
      - enrlm_table_create_err
      - enrlm_table_index_err
      - enrlm_table_vacuum_err

  admissions:
    run: medicare_admissions.cwl
    doc: Process medicare inpatient admissions (aka Medpar) data
    in:
      database: database
      connection_name: connection_name
      depends_on: enrollments/enrlm_table_vacuum_log
    out:
      - ip_create_log
      - ip_create_err
      - adm_create_log
      - adm_create_err
      - adm_populate_log
      - adm_populate_err
      - adm_index_log
      - adm_index_err
      - adm_vacuum_log
      - adm_vacuum_err


  qc:
    run: medicare_qc.cwl
    doc: Build QC Tables
    in:
      database: database
      connection_name: connection_name
      depends_on: admissions/adm_vacuum_log
    out:
      - ev_create_log
      - ev_create_err
      - av_create_log
      - av_create_err
      - enrollmen343_create_log
      - enrollmen343_index_log
      - enrollmen343_vacuum_log
      - enrollmen343_create_err
      - enrollmen343_index_err
      - enrollmen343_vacuum_err
      - admission697_create_log
      - admission697_index_log
      - admission697_vacuum_log
      - admission697_create_err
      - admission697_index_err
      - admission697_vacuum_err

  grant:
    run: alter_database.cwl
    doc: |
      Grants read access to the members of NSAPH group for newly created
      or updated tables
    in:
      database: database
      connection_name: connection_name
      depends_on: qc/admission697_vacuum_log
    out:
      - log
      - err

outputs:
  ## Generated by nsaph/util/cwl_collect_outputs.py from medicare_beneficiaries.cwl:
    initdb_log:
      type: File
      outputSource: initdb/log
    initdb_err:
      type: File
      outputSource: initdb/err

    load_raw_log:
      type: File
      outputSource: load_raw_data/log
    load_raw_err:
      type: File
      outputSource: load_raw_data/err
    registry:
      type: File
      outputSource: load_raw_data/registry

    d_create_log:
      type: File
      outputSource: enrollments/d_create_log
    d_create_err:
      type: File
      outputSource: enrollments/d_create_err
    d_index_log:
      type: File
      outputSource: enrollments/d_index_log
    d_index_err:
      type: File
      outputSource: enrollments/d_index_err
    d_vacuum_log:
      type: File
      outputSource: enrollments/d_vacuum_log
    d_vacuum_err:
      type: File
      outputSource: enrollments/d_vacuum_err

    ps_create_log:
      type: File
      outputSource: enrollments/ps_create_log
    ps_create_err:
      type: File
      outputSource: enrollments/ps_create_err
    ps2_create_log:
      type: File
      outputSource: enrollments/ps2_create_log
    ps2_create_err:
      type: File
      outputSource: enrollments/ps2_create_err
    bene_view_log:
      type: File
      outputSource: enrollments/bene_view_log
    bene_view_err:
      type: File
      outputSource: enrollments/bene_view_err
    bene_table_create_log:
      type: File
      outputSource: enrollments/bene_table_create_log
    bene_table_index_log:
      type: File
      outputSource: enrollments/bene_table_index_log
    bene_table_vacuum_log:
      type: File
      outputSource: enrollments/bene_table_vacuum_log
    bene_table_create_err:
      type: File
      outputSource: enrollments/bene_table_create_err
    bene_table_index_err:
      type: File
      outputSource: enrollments/bene_table_index_err
    bene_table_vacuum_err:
      type: File
      outputSource: enrollments/bene_table_vacuum_err
    enrlm_view_log:
      type: File
      outputSource: enrollments/enrlm_view_log
    enrlm_view_err:
      type: File
      outputSource: enrollments/enrlm_view_err
    enrlm_table_create_log:
      type: File
      outputSource: enrollments/enrlm_table_create_log
    enrlm_table_index_log:
      type: File
      outputSource: enrollments/enrlm_table_index_log
    enrlm_table_vacuum_log:
      type: File
      outputSource: enrollments/enrlm_table_vacuum_log
    enrlm_table_create_err:
      type: File
      outputSource: enrollments/enrlm_table_create_err
    enrlm_table_index_err:
      type: File
      outputSource: enrollments/enrlm_table_index_err
    enrlm_table_vacuum_err:
      type: File
      outputSource: enrollments/enrlm_table_vacuum_err
  ## Generated by nsaph/util/cwl_collect_outputs.py from medicare_admissions.cwl:
    ip_create_log:
      type: File
      outputSource: admissions/ip_create_log
    ip_create_err:
      type: File
      outputSource: admissions/ip_create_err
    adm_create_log:
      type: File
      outputSource: admissions/adm_create_log
    adm_create_err:
      type: File
      outputSource: admissions/adm_create_err
    adm_populate_log:
      type: File
      outputSource: admissions/adm_populate_log
    adm_populate_err:
      type: File
      outputSource: admissions/adm_populate_err
    adm_index_log:
      type: File
      outputSource: admissions/adm_index_log
    adm_index_err:
      type: File
      outputSource: admissions/adm_index_err
    adm_vacuum_log:
      type: File
      outputSource: admissions/adm_vacuum_log
    adm_vacuum_err:
      type: File
      outputSource: admissions/adm_vacuum_err

  ## Generated by nsaph/util/cwl_collect_outputs.py from medicare_qc.cwl:
    qc_ev_create_log:
      type: File
      outputSource: qc/ev_create_log
    qc_ev_create_err:
      type: File
      outputSource: qc/ev_create_err
    qc_av_create_log:
      type: File
      outputSource: qc/av_create_log
    qc_av_create_err:
      type: File
      outputSource: qc/av_create_err
    qc_enrollmen343_create_log:
      type: File
      outputSource: qc/enrollmen343_create_log
    qc_enrollmen343_index_log:
      type: File
      outputSource: qc/enrollmen343_index_log
    qc_enrollmen343_vacuum_log:
      type: File
      outputSource: qc/enrollmen343_vacuum_log
    qc_enrollmen343_create_err:
      type: File
      outputSource: qc/enrollmen343_create_err
    qc_enrollmen343_index_err:
      type: File
      outputSource: qc/enrollmen343_index_err
    qc_enrollmen343_vacuum_err:
      type: File
      outputSource: qc/enrollmen343_vacuum_err
    qc_admission697_create_log:
      type: File
      outputSource: qc/admission697_create_log
    qc_admission697_index_log:
      type: File
      outputSource: qc/admission697_index_log
    qc_admission697_vacuum_log:
      type: File
      outputSource: qc/admission697_vacuum_log
    qc_admission697_create_err:
      type: File
      outputSource: qc/admission697_create_err
    qc_admission697_index_err:
      type: File
      outputSource: qc/admission697_index_err
    qc_admission697_vacuum_err:
      type: File
      outputSource: qc/admission697_vacuum_err

## Generated by nsaph/util/cwl_collect_outputs.py from grant_read_access.cwl:
    grant_log:
      type: File
      outputSource: grant/log
    grant_err:
      type: File
      outputSource: grant/err

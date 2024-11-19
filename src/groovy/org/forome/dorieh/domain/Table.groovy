/*
 * Copyright (c) 2024. Harvard University
 *
 * Developed by Research Software Engineering,
 * Harvard University Research Computing and Data (RCD) Services.
 *
 * Author: Michael A Bouzinier
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *          http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 *
 *
 *
 *
 */

package org.forome.dorieh.domain



class Table extends Base
{
    static final public DEFAULT_TYPE = "VARCHAR"
    String name
    String description
    String type // Could be view, table, etc.
    List<String> from
    List<Column> columns = []

    def methodMissing(String name, Object args)
    {
        Object arg0 = args == null ? null : args [0]
        if (currentContext != null) {
            switch (currentContext) {
                case "columns":
                    if (arg0 instanceof String) {
                        column (name, arg0)
                    } else if (arg0 instanceof Closure) {
                        Closure closure = arg0
                        Column column = new Column(name)
                        closure.delegate = column
                        closure.resolveStrategy = Closure.DELEGATE_FIRST
                        closure.call ()
                        columns << column
                    }
                    return 
                default:
                    break
            }
        }  else  if (arg0 == null) {
            currentContext = name.toLowerCase ()
            return
        }

        println "Table methodMissing called with name: $name and args: $args"
    }

    public void of (args)
    {
        if (currentContext != null) {
            switch (currentContext) {
                case "union":
                    unionOf (args)
                    return
            }
        } else {
            currentContext = args
            return
        }

        throw new IllegalStateException("Unexpected identifier 'of'")
    }

    public void columns(Closure closure)
    {
        currentContext = "columns"
        closure.call ()
    }

    public void from (String... tables)
    {
        from = tables.toList ()
    }

    public void from (Closure listClosure)
    {
        ListCollector collector = new ListCollector()
        call (listClosure, collector)
        from = collector.getItems ()
    }

    private arg0(args)
    {
        if (args == null)
            args = currentContext
        Object arg0 = null
        if (args instanceof List && args.size () > 0) {
            arg0 = args [0]
        } else if (args instanceof Closure || args instanceof String) {
            arg0 = args
        }
        return arg0
    }

    public void union (args)
    {
        def arg0 = arg0 (args)
        if (arg0 instanceof Closure) {
            from((Closure)arg0)
        } else if (arg0 instanceof String) {
            from = [args]
        } else {
            throw new IllegalStateException("Invalid union statement")
        }
    }

    public void aggregation (args)
    {
        def arg0 = arg0 (args)
        if (arg0 instanceof Closure) {
            from((Closure)arg0)
        } else if (arg0 instanceof String) {
            from = [arg0]
        } else {
            throw new IllegalStateException("Invalid aggregation statement")
        }
    }

    public void on(args)
    {
        column (args)
    }

    def column(String name, String type, Map<String, Object> attributes = [:]) {
        Column column = new Column(name, type, attributes)
        // column.with(columnDef)
        columns << column
    }

    def column(String name, Map<String, Object> attributes = [:]) {
        column (name, DEFAULT_TYPE, attributes)
    }

    String toString() {
        return "Table(name: ${name}, type: ${type}, columns: ${columns})"
    }

    public void setProperty(String name, Object value)
    {
        switch (name) {
            case "columns":
                currentContext = "columns"
                return
            default:
                break
        }

        switch (currentContext) {
            case "columns":
                column(name, (String)value)
                break
            default:
                super.setProperty(name, value)

        }

    }

    public Object getProperty (String name)
    {
        try {
            super.getProperty (name)
        } catch (MissingPropertyException x) {
            return name
        }
    }

    String toYAML(int indent)
    {
        String prefix = "  " * indent
        String body = "${prefix}# ${type}: ${name}\n"
        body = addElement (body, name, "", indent)
        indent += 1
        if (description != null)   {
            body = addText (body, "description", description, indent)
        }
        if (type != null) {
            body = addElement (body, "type", type, indent)
        }
        if  (from != null) {
            if (from.size () > 1)  {
                body = addList (body, "from", from, indent)
            }
            else if (!from.isEmpty ()) {
                body = addElement (body, "from", from [0], indent)
            }
        }
        List<String> columnNames = new ArrayList<>()
        for (Column column: columns) {
            columnNames.add (column.name)
        }
        body = addElement (body, "columns", "", indent)
        for (Column column: columns) {
            String cc = column.toYAML(indent)
            body += cc + '\n'
        }
        return body
    }
}



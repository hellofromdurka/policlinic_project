from database import connection


def check_connection(db_config, *_sql):
    with connection.DBContextManager(db_config) as cursor:
        if type(cursor) == tuple:
            return False
        else:
            cursor.execute(_sql[0])
            role = cursor.fetchall()[0][0].split('@')[0].replace("`", "")
            return role


def select_from_db(db_config, _sql):
    with connection.DBContextManager(db_config) as cursor:
        if cursor:
            cursor.execute(_sql)
            schema = [column[0] for column in cursor.description]
            result = [dict(zip(schema, row)) for row in cursor.fetchall()]
            return result
        else:
            raise ValueError("ERROR. CURSOR NOT CREATED!")


def default_statement(db_config, _sql):
    with connection.DBContextManager(db_config) as cursor:
        if cursor:
            print(cursor.execute(_sql))
            return True


def call_proc(db_config, proc_name, *args):
    with connection.DBContextManager(db_config) as cursor:
        if cursor:
            param_list = list(args)

            cursor.callproc(proc_name, param_list)
            cursor.execute('SELECT @result_message')

            result = cursor.fetchone()[0]

            print(result)

            return result
        else:
            raise ValueError("ERROR. CURSOR NOT CREATED")
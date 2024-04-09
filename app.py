from flask import Flask, render_template, session, request
from timetable.timetable import timetable_app
from reports.reports import reports_app
from appointment.appointment import appointment_app
from visit.visit import visit_app
from auth.auth import auth_app
import json

app = Flask(__name__)
app.secret_key = 'e58b116b7a9c7fab192e1e0c68d713aa24c64382636fc22'
app.config['MYSQL_DB_CONFIG'] = json.load(open('configs/db_config.json'))

app.register_blueprint(timetable_app, url_prefix='/timetable')
app.register_blueprint(reports_app, url_prefix='/reports')
app.register_blueprint(appointment_app, url_prefix='/appointment')
app.register_blueprint(visit_app, url_prefix='/visit')
app.register_blueprint(auth_app, url_prefix='/auth')


with open('configs/reports.json', 'r', encoding='UTF-8') as file:
    reports = json.load(file)
    app.config['reports_list'] = [
        {
            'rep_name': report['rep_name'],
            'rep_id': report['rep_id'],
            'procedure': report['procedure'],
            'sql_statement': report['sql_statement']
        }
        for report in reports
    ]


@app.route('/')
def index_handler():
    message = ""
    if request.args:
        message = request.args.get('error')
    if session.get('is_auth'):
        return render_template('index.html', login=session['is_auth'], role=session['role'], message=message)
    return render_template('index.html', message=message)


# @all_app.route('/')
# @login_required(session)
# def all_index_handler():
#     return render_template('all_index.html', role=session['role'])


if __name__ == '__main__':
    settings = {'host': '127.0.0.1', 'port': 5000}
    app.run(host=settings['host'], port=settings['port'], debug=True)

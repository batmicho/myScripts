from flask import Flask, render_template, json, request
import subprocess

app = Flask(__name__)

@app.route("/")
def hello():
    return render_template('index.html')


@app.route("/check", methods=['POST'])
def check():
    f = open('vps-consistency.txt', 'w')
    f.write(request.form.get('data'))
    f.close()

    cmd = ["bash", "mySortedCheck.sh"]
    subprocess.Popen(cmd)

    response = app.response_class(
        response=json.dumps('processing..'),
        status=200,
        mimetype='application/json'
    )

    return response

@app.route("/read", methods=['GET'])
def read():
    f = open('sortedCheck.txt')
    response = app.response_class(
        response=json.dumps('%s' % f.read()),
        status=200,
        mimetype='application/json'
    )

    return response

from flask import Flask
import datetime
import os

app = Flask(__name__)

@app.route('/')
def hello():
    f = open("/data/test.txt","r")
    lines = f.readlines()

    var inTest = ""
    for line in lines:
        inTest = inTest + line
    return "Hello Senor Vivo! " + str(datetime.datetime.now()) + " " + inTest

if __name__ == '__main__':
    port = os.environ.get('FLASK_PORT') or 8080
    port = int(port)

    app.run(port=port,host='0.0.0.0')

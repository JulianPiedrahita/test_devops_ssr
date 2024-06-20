from flask import Flask

app = Flask(__name__)

@app.route('/')
def environment_develop():
    return 'Hola te encuentras en el ambiente de pruebas!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=82)

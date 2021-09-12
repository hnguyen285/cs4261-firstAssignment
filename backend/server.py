from flask import Flask
import database_queries
from flask import request
from flask_cors import CORS, cross_origin

app = Flask(__name__)
CORS(app)

db = database_queries.DB()


@app.route("/api/login", methods=['POST'])
@cross_origin()
def login():
    data = request.get_json(force=True)
    print(data)
    username = data["username"]
    password = data["password"]
    response = {}
    try:
        if username and password:
            print("here")
            results = db.get_user_login(username)
            print(results)
            get_password = results[0][0]
            print(get_password)
            print(type(get_password))
            if get_password == password:
                response["status"] = "loggedIn"
            else:
                response["status"] = "IncorrectPassword"
        else:
            response["status"] = "invalidInput"
        return response
    except Exception as ex:
        return ex


@app.route("/api/createAccount", methods=['POST'])
@cross_origin()
def create_account():
    data = request.get_json(force=True)
    username = data["username"]
    password = data["password"]
    response = {}
    try:
        is_valid = db.get_user_login(username)
        # check if username exists
        if len(is_valid):
            response["status"] = "Username exists"
        # check if inputs are invalid
        elif username and password:
            db.create_new_user(username, password)
            response["status"] = "success"
        return response
    except Exception as ex:
        return ex

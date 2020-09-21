from flask import Flask, request
import json
import scaling
app = Flask(__name__)

@app.route("/webhook", methods = ["GET", "POST"])
def scaling_hook():

    data = request.json
    value = dict(data)

    print(type(value["alerts"]))
    print(value["alerts"][0]["annotations"])

    return data 

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)

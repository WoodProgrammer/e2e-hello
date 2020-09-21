from flask import Flask, jsonify
from prometheus_flask_exporter import PrometheusMetrics

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route("/hi")
def hello_world():
    return jsonify({"hello":"world"})

@app.route("/ping")
@metrics.do_not_track()
def health_check():
    return "pong",200


if __name__ == '__main__':
    app.run("0.0.0.0", 5000, threaded=True)

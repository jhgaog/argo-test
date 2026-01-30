from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def hello():
    env = os.getenv("ENVIRONMENT", "dev")
    version = os.getenv("APP_VERSION", "v1.0")
    return f"Hello from Argo + Python!!!! 🐍\nEnvironment: {env}\nVersion: {version}\n"

if __name__ == '__main__':
    # ✅ 关键修复：host 和 port 必须分开传！
    app.run(host='0.0.0.0', port=8000, debug=False)

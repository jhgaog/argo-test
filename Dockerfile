# Dockerfile —— 多阶段构建，安全精简（基于 python:3.11-slim）
FROM 10.62.48.116:30085/library/python:3.11-slim

# 设置工作目录
WORKDIR /app

# 复制依赖清单并安装（利用 layer 缓存）
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 复制应用代码
COPY app.py .

# 设置非 root 用户（安全最佳实践）
RUN useradd -m -u 1001 -g root appuser
USER appuser

# 暴露端口（仅声明，不实际启动）
EXPOSE 8000

# 启动命令（支持环境变量覆盖）
CMD ["python", "app.py"]

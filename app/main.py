"""Minimal API used to demonstrate a secure CI/CD pipeline."""
import os

from fastapi import FastAPI

app = FastAPI(title="devsecops-demo", version=os.getenv("APP_VERSION", "0.1.0"))


@app.get("/")
def root() -> dict:
    return {"service": "devsecops-demo", "version": app.version}


@app.get("/health")
def health() -> dict:
    return {"status": "ok"}

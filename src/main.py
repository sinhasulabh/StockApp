import os
from fastapi import FastAPI
import uvicorn

app = FastAPI(title="StockApp Microservice")


@app.get("/health")
async def health_check():
    return {"status": "healthy"}

if __name__ == "__main__":
    # Cloud Run provides the port via an environment variable
    port = int(os.environ.get("PORT", 8080))
    # We use 0.0.0.0 so the container can accept external traffic
    uvicorn.run(app, host="0.0.0.0", port=port)
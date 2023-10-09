from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

# uvicorn perfumeTest:app --reload

class Perfume(BaseModel):
    name: str
    description: str
    imageUrl: str

@app.get("/")
async def perfume(value: float, preference: str):
    print(value, preference)
    return {"result" : Perfume(name = "perfume name", description = "this perfume is..", imageUrl = "https://puls-img.chanel.com/1688483382665-oneplpherobannermobile1500x1600pxjpg_1600x1500.jpg")}
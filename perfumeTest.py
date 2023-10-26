from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

# uvicorn perfumeTest:app --reload

@app.get("/weather")
async def weather(lat: str, lon: str):
# fetch weather using location from api 
    return "맑음"

class Perfume(BaseModel):
    name: str
    description: str
    imageUrl: str

@app.get("/recommend")
async def perfume(value: float, preference: str):
    print(value, preference)
    if value > 0.5 and value <= 1:
        return {
            "perfume" : Perfume(
                name = "perfume name", 
                description = "this perfume is..", 
                imageUrl = "https://puls-img.chanel.com/1688483382665-oneplpherobannermobile1500x1600pxjpg_1600x1500.jpg"
                )
                }
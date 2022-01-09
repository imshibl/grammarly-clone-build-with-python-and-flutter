from fastapi import FastAPI
from gingerit.gingerit import GingerIt
import app.schemas as schemas


app = FastAPI()

def correction(word):
    corrected_word = GingerIt().parse(word)
    return corrected_word
    


@app.get('/gingerapp/{word}')
def home(word: str):
    return correction(word)
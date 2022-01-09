from pydantic import BaseModel
from typing import Optional

class TextBase(BaseModel):
    word: str
    
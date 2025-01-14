from typing import List

async def example_func(*n : List[int]) -> int:
    return sum(n)
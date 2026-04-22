## Fix 1
**File:** api/main.py
**Line:** 8 
**Problem:** `r = redis.Redis(host="localhost", port=6379)` — localhost inside a container refers to the container itself, not other containers. Redis runs in a separate container so localhost will never find it. Port was also hardcoded.
**Fix:** Changed to use `os.getenv("REDIS_HOST", "redis")` and `int(os.getenv("REDIS_PORT", "6379"))`

## Fix 2
**File:** api/requirements.txt
**Line:** 1, 2, 3 and 4
**Problem:** No version numbers
**Fix:** Included version numbers in all

## Fix 3
**File:** worker.py
**Line:** 6 
**Problem:** `r = redis.Redis(host="localhost", port=6379)` — localhost inside a container refers to the container itself, not other containers. Redis runs in a separate container so localhost will never find it. Port was also hardcoded.
**Fix:** Changed to use `os.getenv("REDIS_HOST", "redis")` and `int(os.getenv("REDIS_PORT", "6379"))`
**Line:** 14
**Problem:** The `while True` loop had no error handling. If Redis went down or a job failed, the entire worker would crash and stop processing jobs permanently.
**Fix:** Wrapped the loop body in a `try/except` block so errors are caught, logged, and the worker continues running.

## Fix 4
**File:** worker/requirements.txt
**Line:** 1
**Problem:** No version number
**Fix:** Added version number to redis

## Fix 5
**File:** frontend/app.js
**Line:** 6
**Problem:** Code was hardcoded and needed to use enviroment variable and local host needed to call api also
**Fix:** `const API_URL = process.env.API_URL || "http://api:8000"`

## Fix 6
**File:** frontend/package.json
**Line:** 9 and 10
**Problem:** The problem here is the "^" sign
**Fix:** Removed it so that the dependencies remains the same at all time

## Fix 7
**File:** frontend/views/index.html
**Line:** 31
**Problem:** The pollJob function is an infinite loop, nothing stops it
**Fix:** Added maximum number of retries, returns error once it elapses, set timeout to include pollJob(id, retries + 1)


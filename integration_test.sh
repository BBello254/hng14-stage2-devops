#!/bin/bash
set -e

echo "Starting integration test..."

# Submit a job
JOB_ID=$(curl -s -X POST http://localhost:8000/jobs | python3 -c "import sys,json; print(json.load(sys.stdin)['job_id'])")
echo "Job ID: $JOB_ID"

# Poll for completion with timeout
for i in $(seq 1 15); do
    STATUS=$(curl -s http://localhost:8000/jobs/$JOB_ID | python3 -c "import sys,json; print(json.load(sys.stdin)['status'])")
    echo "Status: $STATUS"
    if [ "$STATUS" = "completed" ]; then
        echo "Integration test passed!"
        exit 0
    fi
    sleep 2
done

echo "Integration test failed - job did not complete in time"
exit 1
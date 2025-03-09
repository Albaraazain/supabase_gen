#!/bin/bash

# Start Supabase in the background
echo "Starting Supabase..."
supabase start &
SUPABASE_PID=$!

# Wait for Supabase to start (adjust sleep time if needed)
sleep 10

# Start ngrok
echo "Starting ngrok tunnel..."
ngrok start supabase --config=./ngrok.yml

# Handle script termination
trap 'kill $SUPABASE_PID' EXIT

# Keep the script running
wait
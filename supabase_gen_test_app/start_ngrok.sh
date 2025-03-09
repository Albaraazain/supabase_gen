#!/bin/bash

# Start ngrok tunnel for Supabase
echo "Starting ngrok tunnel for Supabase..."
echo "Once ngrok starts, copy the HTTPS URL and update your .env file"

ngrok start supabase --config=./ngrok.yml

# Note: After ngrok starts, copy the HTTPS URL and update the SUPABASE_URL in your .env file
# The default anon key should be: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0
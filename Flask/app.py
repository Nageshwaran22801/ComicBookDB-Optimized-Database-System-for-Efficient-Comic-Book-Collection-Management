from flask import Flask, render_template, request
import psycopg2
import time

app = Flask(__name__)

# Database configuration
DB_NAME = "Comics"
DB_USER = "postgres"
DB_PASSWORD = "N@gammal22801"
DB_HOST = "localhost"
DB_PORT = "5432"

# Number of entries per page
ENTRIES_PER_PAGE = 10

def execute_query(query):
    conn = psycopg2.connect(dbname=DB_NAME, user=DB_USER, password=DB_PASSWORD, host=DB_HOST, port=DB_PORT)
    cur = conn.cursor()
    
    # Record the start time
    start_time = time.time()
    
    cur.execute(query)
    result = cur.fetchall()
    
    # Calculate the execution time
    execution_time = time.time() - start_time
    
    column_names = [desc[0] for desc in cur.description]
    conn.close()
    return column_names, result, execution_time

@app.route('/', methods=['GET', 'POST'])
def index():
    query = ''  # Initialize query variable
    if request.method == 'POST':
        if 'query' in request.form:
            query = request.form['query']
        if 'refresh' in request.form:
            query = ''  # Reset query to empty string when refresh button is clicked
            return render_template('index.html', query=query)

        if query:  # Only execute the query if it's not empty
            column_names, result, execution_time = execute_query(query)
            page = 1  # Default page number
            total_entries = len(result)
            total_pages = (total_entries - 1) // ENTRIES_PER_PAGE + 1

            # Pagination logic
            if 'page' in request.form:
                page = int(request.form['page'])
                start_index = (page - 1) * ENTRIES_PER_PAGE
                end_index = start_index + ENTRIES_PER_PAGE
                result = result[start_index:end_index]

            return render_template('index.html', column_names=column_names, result=result, query=query, page=page, total_pages=total_pages, execution_time=execution_time)
    return render_template('index.html', query=query)

if __name__ == '__main__':
    app.run(debug=True)

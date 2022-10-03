import json 

from flask import Flask, render_template #for jinja templates
from flask_mysqldb import MySQL


app = Flask("MovieApp") # class module is instantiated 
app.config['MYSQL_HOST'] = "127.0.0.1"
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'my-secret-pw'
app.config['MYSQL_DB'] = 'movie_db'

mysql = MySQL(app)


@app.route("/") # decorator
def hello_world():
    return("<p> Hey in die Welt !</p>")

@app.route("/movies/")
def list_movies():
    cursor = mysql.connection.cursor()
    query_string = "SELECT * FROM movies_tbl"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    return json.dumps(data)

@app.route("/movies-table/")
def list_movie_table():
    cursor = mysql.connection.cursor()
    query_string = "SELECT * FROM movies_tbl"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    return render_template("movies.html", movies_data = data)

@app.route("/actors-table/")
def list_actors_table():
    cursor = mysql.connection.cursor()
    query_string = "SELECT * FROM main_actors_tbl"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    return json.dumps(data)

if __name__ == "__main__":
    app.run(host="127.0.0.1")

CREATE TABLE omdb_test (
        id SERIAL PRIMARY KEY,
        title VARCHAR(400),
        year INTEGER,
        runtime VARCHAR(255),
        actors VARCHAR(1000),
        language VARCHAR(1000),
        plot TEXT,
        poster TEXT
);


INSERT INTO omdb_test ( title, year, runtime, actors, language, plot, poster)
VALUES ('test3', '20220', '39hr', 'su1n, martin scorases', 'wacadanian','A dumbass from Mars', 'www.ggole.com');


SELECT title FROM omdb_test 

-- <section> Please type your movie title : </section>
--     <input type="text" name="title" value="Wall street">
--     <form action="/movie" method="GET">          
--     <button>Search</button></form>

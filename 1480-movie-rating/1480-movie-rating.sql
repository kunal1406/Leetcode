# Write your MySQL query statement below
(SELECT name as results from Users 
Join MovieRating
on Users.user_id = MovieRating.user_id
Group by name
order by Count(movie_id) DESC, name
limit 1)

UNION ALL

(SELECT title as results from Movies
Join MovieRating
on Movies.movie_id = MovieRating.movie_id
where EXTRACT(YEAR_MONTH FROM created_at) = 202002
group by title
order by AVG(rating) DESC, title
limit 1)

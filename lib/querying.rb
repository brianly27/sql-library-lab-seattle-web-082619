def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT b.title, CAST(b.year AS INTEGER)
  FROM books b
  JOIN series s
  ON b.series_id = s.id
  WHERE s.id = 1
  ORDER BY b.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
  FROM characters
  WHERE id = (
    SELECT id FROM characters
    ORDER BY LENGTH(motto)
    DESC
    LIMIT 1)"
end


def select_value_and_count_of_most_prolific_species
  "SELECT *
  FROM (
    SELECT species, COUNT(species) AS species_count
    FROM characters
    GROUP BY species
    ORDER BY COUNT(species)
    DESC
    LIMIT 1
  )"

end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM series
  JOIN authors ON series.author_id = authors.id
  JOIN subgenres ON subgenres.id = series.subgenre_id"
end

def select_series_title_with_most_human_characters
  "SELECT title 
  FROM (
    SELECT series.title, COUNT(characters.species)
    FROM series
    JOIN authors
    ON series.author_id = authors.id
    JOIN characters
    ON characters.author_id = authors.id
    WHERE characters.species = \"human\"
    GROUP BY series.title
    ORDER BY COUNT(characters.species)
    DESC
    LIMIT 1
  )"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.character_id)
  FROM characters
  JOIN character_books
  ON characters.id = character_books.character_id
  GROUP BY characters.name
  ORDER BY COUNT(character_books.character_id)
  DESC
  "
end

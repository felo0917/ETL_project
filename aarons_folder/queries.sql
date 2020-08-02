SELECT athlete.name, country.country
FROM athlete
JOIN Country on athlete.nationality = country.id
WHERE name = 'Michael Fred Phelps, II'

SELECT athlete.name, country.country, athlete_event.athlete_id, athlete_event.medal
FROM athlete
JOIN Country on athlete.nationality = country.id
JOIN Athlete_event on athlete.id = athlete_event.athlete_id
WHERE name = 'Michael Fred Phelps, II'
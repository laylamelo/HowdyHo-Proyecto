# SQL Murder Mystery: A crime has taken place and the detective needs your help. The detective gave you the crime scene report, but you somehow lost it. You vaguely remember that the crime was a ​murder​ that occurred sometime on ​Jan.15, 2018​ and that it took place in ​SQL City​. Start by retrieving the corresponding crime scene report from the police department’s database.

SELECT description
FROM crime_scene_report
WHERE date = 20180115 AND type = 'murder' AND city = 'SQL City'
#Description: Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".

SELECT id, person_id, name
FROM get_fit_now_member
WHERE name LIKE 'Annabel%'
#id, person_id, name
#90081, 16371, Annabel Miller

SELECT person_id, transcript
FROM interview
WHERE person_id = 16371
#I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

SELECT address_street_name, address_number, name, id, license_id, ssn
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
#address_street_name, address_number, name, id, license_id, ssn
#Northwestern Dr, 4919, Morty Schapiro, 14887, 118009, 111564949


SELECT DISTINCT gf.person_id, p.name, p.address_street_name
FROM get_fit_now_member gf
 LEFT JOIN person p ON gf.id = p.id
WHERE p.name NOT NULL
 #Morty Schapiro is not a Get Fit Now member!

SELECT COUNT (name)
 FROM person
 WHERE name LIKE 'Morty%'
 #Only 1 person named Morty on the person table

SELECT COUNT (name)
 FROM get_fit_now_member
 WHERE name LIKE 'Morty%'
#Confirmation Morty is really not subscribed on the gym

SELECT * FROM facebook_event_checkin
WHERE person_id = 16371
#person_id, event_id, event_name, date
#16371, 4719, The Funky Grooves Tour, 20180115
#Annabel activity on Facebook

SELECT fb.person_id, gf.id, gf.name
FROM facebook_event_checkin fb JOIN get_fit_now_member gf ON fb.person_id = gf.person_id
WHERE date = 20180115
#person_id, id, name
#16371 90081 Annabel Miller
#67318 48Z55 Jeremy Bowers
#Who else was on the Funky Grooves Tour event at the 15th with Annabel? Did he testify?

SELECT person_id, transcript
FROM interview
WHERE person_id = 67318
#person_id, transcript
#67318, I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT *
FROM drivers_license
WHERE hair_color = 'red'AND gender = 'female' AND car_make LIKE 'Tesla%'
#id age height eye_color hair_color gender plate_number car_make car_model
#202298 68 66 green red female 500123 Tesla Model S
#291182 65 66 blue red female 08CM64 Tesla Model S
#918773 48 65 black red female 917UU3 Tesla Model S
#Females with red hair color and with a Tesla Model S. Only one with height 65 or 67 is the one with id 291182

SELECT *
FROM person
WHERE id = 291182
#Trying to get the ssn to later see income...no data returned WTF??

SELECT DISTINCT person_id, event_name
FROM facebook_event_checkin WHERE event_name = 'SQL Symphony Concert' AND date LIKE '%201712%'
#People who attended SQL Symphony Concert in December (lots, won't record)

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;
#value
#Congrats, you found the murderer! But wait, there's more... If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. Use this same INSERT statement with your new suspect to check your answer.
#THE GUY FROM THE FACEBOOK EVENT WAS THE MURDERER!!! YAAAAAAAAAAAAAAY! Assumed since he spoke about a rich woman, assuming that he is not, and hat murders ofer occur from money issues. Who hired him though was the woman with a red hair and lots of money...

SELECT * FROM get_fit_now_member
WHERE person_id = 67318
# id person_id name membership_start_date membership_status
# 48Z55 67318 Jeremy Bowers 20160101 gold
#Jeremy is a gold member at the Get Fit Now
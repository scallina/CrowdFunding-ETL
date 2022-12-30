-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT c.backers_count, c.cf_id
FROM CAMPAIGN as c
WHERE outcome = 'live'
ORDER BY cf_id DESC
;

-- confirm using the backers table 
SELECT c.backers_count, c.cf_id, b.backer_id
FROM CAMPAIGN as c
JOIN backers as b
ON b.cf_id = c.cf_id
WHERE outcome = 'live'
ORDER BY cf_id DESC
;

-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT co.first_name, co.last_name, co.email, (ca.goal - ca.pledged) AS "Remaining Goal Amount"
FROM contacts as co
JOIN campaign as ca
ON co.contact_id = ca.contact_id
ORDER BY "Remaining Goal Amount" DESC
;


-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email , first_name, b.last_name, b.cf_id, c.company_name, c.description, c.end_date, (c.goal - c.pledged) AS "Left of GOAL"
FROM backers as b
JOIN campaign as c
ON c.cf_id = b.cf_id
ORDER BY b.email DESC
;

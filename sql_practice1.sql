

---users who commented on the third photo, and their comments
SELECT photo_id,username,cmt
FROM users
JOIN comnts ON users.id = comnts.user_id
WHERE photo_id = 3;

---number of comments under each picture
SELECT photos.id, pics,COUNT(cmt) AS num_of_comments
FROM photos
JOIN comnts ON photos.id = comnts.photo_id
GROUP BY pics, photos.id
ORDER BY photos.id;

---number of comments under the first 7 pictures
SELECT photos.id, pics,COUNT(cmt)
FROM photos
JOIN comnts ON photos.id = comnts.photo_id
WHERE photos.id <= 7
GROUP BY photos.id
ORDER BY photos.id;

---number of pictures posted by each user
SELECT users.id, username, COUNT(pics)
FROM users
JOIN photos ON users.id = photos.user_id
GROUP BY users.id;

---number of comments by each user 
SELECT users.id, username, COUNT(cmt)
FROM users
JOIN comnts ON users.id = comnts.user_id
GROUP BY users.id;

---users that commented on their own pictures
SELECT photos.id, pics, cmt, comnts.id
FROM photos
JOIN comnts ON photos.id = comnts.photo_id
WHERE photos.user_id = comnts.user_id;

---users and the number of comments they made
SELECT user_id,username, COUNT(*) FROM comnts
JOIN users ON users.id = comnts.user_id
GROUP BY user_id,username
ORDER BY user_id;

---first 6 pictures having more than 3 comments
SELECT photo_id, COUNT(cmt)
FROM comnts
WHERE photo_id < 7
GROUP BY photo_id
HAVING COUNT(cmt) >3;

---users that commented on the first 2 photos and number of comments is more than 2
SELECT users.username, user_id, COUNT(comnts) AS num_of_comments
FROM comnts
JOIN users ON comnts.user_id = users.id
WHERE photo_id < 3
GROUP BY username,user_id
HAVING COUNT(comnts) >= 2;

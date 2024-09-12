
# Gamify Fitness
## Routes
### Auth:
Register: `POST /auth/signup` <br>
Login: `POST /auth/signin`

### User:
get all users: `POST /user/get` <br>

get user by userId: `POST /user/get/:userId` <br>

update user: `POST /user/update` <br>

delete user:  `POST /user/delete`  <br>

get all user connections: `POST /user/connctions`

### Community:
Making Community: `POST /community/make_community` <br>
Getting Community by id : `POST community/:communityId` <br>

### Post:
Making Post: `POST, PUT /post/post` <br>
Getting Post by id : `POST /post/post/:postId` <br>
Comment Post ID: `POST /post/comment/:postId` <br>
Like Post ID: `POST /post/like/:postId` <br>
Retrieves post: `POST /post/user/:userId` <br>

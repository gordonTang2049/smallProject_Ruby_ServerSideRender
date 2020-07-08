CREATE DATABASE goodfoodhunting;

CREATE TABLE dishes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200),
  image_url VARCHAR(500)  
);

INSERT INTO dishes (name, image_url) VALUES ('cake', 'https://external-preview.redd.it/c_vzWtLiA68nNfS1p8Q3AD_396nL39uDIwoj9DDjnC8.jpg?auto=webp&s=a2ef37b6acbe9d2fc0bc8ca737040558f4f6e6a2');

INSERT INTO dishes (name, image_url) VALUES ('ribs', 'https://img.buzzfeed.com/video-api-prod/assets/81733b053eaf4e6c851a676b20798932/BFV6085_Slow-Cooker-Ribs_Thumb.jpg');


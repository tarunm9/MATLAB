# Document distance using tf-idf vectors and applying cosine similarities

Calculating distances between pairs of text documents. These distances will be based on a vanilla-version of term frequency–inverse document frequency (tf-idf).

Cossine distances between 6 documents: 3 documents are synopsis of fairy tales (Red riding hood, the Princess and the pea and Cinderella), the other 3 documents are the abstract
of papers related to protein function prediction (identified as CAFA1, CAFA2 and CAFA3).

![image](https://user-images.githubusercontent.com/43922347/125483779-45328a79-b6b4-4a29-9824-5f89698de4da.png)

It is interesting to note that the 2 types of documents form 2 clear groups: the synopsis of fairy tales are more similar to each other than they are to scientific papers. Also, the “Princess and the pea” is more similar to “Cinderella” than to “Red Riding Hood”, and this makes sense as the “Princess and the pea” and “Cinderella” have many elements in common.

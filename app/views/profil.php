

<head>
    <link rel="stylesheet" href="../../public/css/profil.css">
    <title>Sportify</title>
</head>

<body>


  <aside id="profil">
      <div>
          <p id="coin"><?php echo (int)$point; ?> Sporticoins</p>
      </div>
      <div>
      </div>
  </aside>
  <?php foreach ($posts as $p) { ?>
      <div class="post-container">
          <img src="<?php echo $pp?>"/>
          <p class="author-name"><?php echo $p->getAuteurName(); ?></p>
          <p class="title"><?php echo $p->getTitre(); ?></p>
          <p class="content"><?php echo $p->getContenu(); ?></p>
          <p class="likes">Likes: <?php echo $p->getNbLike(); ?></p>
          <p class="comments">Nombre de commentaires: <?php echo $p->getNbComment(); ?></p>
      </div>
  <?php } ?>

</body>
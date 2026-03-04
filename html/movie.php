<?php
include(__DIR__ . "/../php/db.php");
$id = intval($_GET['id'] ?? 0);
if ($id <= 0) { header("Location: index.php"); exit; }
$stmt = $conn->prepare("SELECT * FROM movies WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$movie = $stmt->get_result()->fetch_assoc();
$stmt->close();
$conn->close();
if (!$movie) { header("Location: index.php"); exit; }
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><?php echo htmlspecialchars($movie['title']); ?> &mdash; CineArchive</title>
  <link rel="stylesheet" href="../css/movies.css">
</head>
<body>

  <header class="site-header">
    <div class="header-top-rule"></div>
    <div class="header-inner">
      <h1 class="site-title">CineArchive</h1>
    </div>
    <div class="header-bottom-rule">
      <span></span><span class="rule-diamond">&#10022; &#9670; &#10022;</span><span></span>
    </div>
  </header>

  <main class="movie-page">

    <section class="movie-hero">
      <div class="movie-poster-col">
        <div class="poster-frame">
          <img src="<?php echo htmlspecialchars($movie['poster_url'] ?? '../images/no-poster.jpg'); ?>"
               alt="<?php echo htmlspecialchars($movie['title']); ?> poster"
               class="poster-img"
               onerror="this.src='../images/no-poster.jpg'">
        </div>
      </div>

      <div class="movie-info-col">
        <div class="info-label">&#9670; Now Showing</div>
        <h2 class="movie-title"><?php echo htmlspecialchars($movie['title']); ?></h2>
        <div class="movie-rule"><span></span><span class="rule-star">&#10022;</span><span></span></div>

        <dl class="movie-meta-list">
          <?php if (!empty($movie['year'])): ?>
          <div class="meta-row"><dt>Year</dt><dd><?php echo intval($movie['year']); ?></dd></div>
          <?php endif; ?>
          <?php if (!empty($movie['genre'])): ?>
          <div class="meta-row"><dt>Genre</dt><dd><?php echo htmlspecialchars($movie['genre']); ?></dd></div>
          <?php endif; ?>
          <?php if (!empty($movie['rating'])): ?>
          <div class="meta-row"><dt>Rating</dt><dd class="rating-val">&#9733; <?php echo number_format((float)$movie['rating'], 1); ?> / 10</dd></div>
          <?php endif; ?>
          <?php if (!empty($movie['director'])): ?>
          <div class="meta-row"><dt>Director</dt><dd><?php echo htmlspecialchars($movie['director']); ?></dd></div>
          <?php endif; ?>
        </dl>

        <?php if (!empty($movie['description'])): ?>
        <div class="movie-synopsis">
          <div class="synopsis-label">Synopsis</div>
          <p><?php echo nl2br(htmlspecialchars($movie['description'])); ?></p>
        </div>
        <?php endif; ?>
      </div>
    </section>

    <section class="player-section" id="player">
      <div class="player-header">
        <div class="player-rule"><span></span><span>&#127902; Now Playing</span><span></span></div>
      </div>
      <div class="player-frame">
        <?php if (!empty($movie['video_url'])): ?>
          <video controls preload="metadata" class="film-player">
            <source src="<?php echo htmlspecialchars($movie['video_url']); ?>" type="video/mp4">
            <p>Your browser does not support HTML5 video.
               <a href="<?php echo htmlspecialchars($movie['video_url']); ?>" target="_blank">Download the film</a>.</p>
          </video>
        <?php else: ?>
          <div class="player-unavailable">
            <span>&#127902;</span><p>Video not currently available</p>
          </div>
        <?php endif; ?>
        <div class="player-corner tl"></div>
        <div class="player-corner tr"></div>
        <div class="player-corner bl"></div>
        <div class="player-corner br"></div>
      </div>
      <p class="pd-note">&#10022; This film is in the public domain &middot; Sourced from archive.org &#10022;</p>

      <!-- Back link centered below player -->
      <div class="back-wrap">
        <a href="index.php" class="back-link">&#8592; Back to Archive</a>
      </div>
    </section>

  </main>

  <footer class="site-footer">
    <div class="footer-rule"><span></span><span>&#10022; CineArchive &#10022;</span><span></span></div>
    <p>&copy; 2026 CineArchive &nbsp;|&nbsp; Public Domain Films</p>
  </footer>

</body>
</html>
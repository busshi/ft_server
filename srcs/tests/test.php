<?php
$user = "user42";
$password = "user42";
$database = "test_db";
$table = "42_projects";

try {
  $db = new PDO("mysql:host=localhost;dbname=$database", $user, $password);
  echo "<h1>TEST BDD mySQL / PHP</h1>";
  echo "<h2>42 PROJECTS</h2><ol>";
  foreach($db->query("SELECT content FROM $table") as $row) {
    echo "<li>" . $row['content'] . "</li>";
  }
  echo "</ol>";
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}

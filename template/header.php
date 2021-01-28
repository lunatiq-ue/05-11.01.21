<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?=($header)? $header : 'Расписание занятий колледжа';?></title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="template/css/bootstrap.min.css">
  <link rel="stylesheet" href="template/css/font-awesome.min.css">
  <link rel="stylesheet" href="template/css/ionicons.min.css">
  <link rel="stylesheet" href="template/css/AdminLTE.min.css">
  <link rel="stylesheet" href="template/css/skins/skin-blue.min.css">
  <link rel="stylesheet"
  href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <a href="index.php" class="logo">
      <span class="logo-mini"><b>A</b>LT</span>
      <span class="logo-lg"><b>Расписание</b></span>
    </a>

    <nav class="navbar navbar-static-top" role="navigation">
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="hidden-xs">Здравствуйте, <?=$_SESSION['fio']?></span>
            </a>
            <ul class="dropdown-menu">
              <li class="user-header">
                

                <p><?=$_SESSION['fio']?>
                  - <?=$_SESSION['roleName']?>
                  
                </p>
              </li>        
              <li class="user-footer">              
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Профиль</a>
                </div>
                <div class="pull-right">
                  <form method="POST">
                    <button type="submit" class="btn btn-default btn-flat" name="out">Выход</button>
                  </form>
                </div>
              </li>
            </ul>
          </li>
         
        </ul>
      </div>
    </nav>
  </header>
  <aside class="main-sidebar">
    <section class="sidebar">

      

      <?php require_once 'template/menu.php'; ?>
    </section>
  </aside>
  <div class="content-wrapper">
  <section class="content container-fluid">

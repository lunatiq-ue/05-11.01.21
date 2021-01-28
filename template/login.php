<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Schedule | Log in</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="template/css/bootstrap.min.css">
    <link rel="stylesheet" href="template/css/font-awesome.min.css">
    <link rel="stylesheet" href="template/css/ionicons.min.css">
    <link rel="stylesheet" href="template/css/AdminLTE.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Расписание занятий</b></a>
  </div>
  <div class="login-box-body">
    <p class="login-box-msg"> <?=$message;?></p>
    <form action="auth.php" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Email" name="login">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name="password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Войти</button>
        </div>
      </div>
    </form>
  </div>
</div>
<script src="template/js/jquery.min.js"></script>
<script src="template/js/bootstrap.min.js"></script>
</body>
</html>

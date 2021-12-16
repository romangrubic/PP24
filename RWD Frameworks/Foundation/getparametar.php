<!-- Top block with head element and navbar element -->
<?php require_once 'block/top.php'; ?>
<!-- Top block finish -->
<!-- Your code start -->
<div id='getparametar' style="background-color:<?php echo $_GET['boja']; ?>">
  <h5 class="text-center" style="font-size:<?php echo $_GET['velicinaslova']; ?>px">Get parametar</h5>
  <p class="text-center" style="font-size:<?php echo $_GET['velicinaslova']; ?>px">Promijeni boju i velicnu slova u URL/u i gledaj kako se stranica mijenja.</p>
</div>
<!-- Your code finish -->
<!-- Bottom block with footer element and scripts -->
<?php require_once 'block/bottom.php'; ?>
<!-- Bottom block finish -->
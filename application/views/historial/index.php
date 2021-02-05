<div class="page-inner">
    <div class="page-header">
        <div class="row">
            <div class="col-md-5">
                <table id="table-historial-folios" class="table table-sm table-hover bg-white">
                    <thead>
                        <tr>
                            <th>#Folio</th>
                            <th>Arts</th>
                            <th>Fecha</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                        <tbody>
                        <?php foreach($ventas as $p){ ?>
                        <tr>
                            <td><?php echo $p['folio']; ?></td>
                            <td><?php echo $p['cantidad']; ?></td>
                            <td>
                                <?php 
                                $f =  strval($p['fecha']);
                                $date=date_create($f);
                                echo date_format($date,"d/m/Y H:i:s");
                                ?>
                            </td>
                            <td>$<?php echo $p['total']; ?></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
            <div class="col-md-7">
            <span>detalles Folios</span>
            </div>
        </div>
    </div>
</div>
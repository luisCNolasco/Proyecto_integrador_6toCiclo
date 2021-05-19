<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mascota</title>

    </head>

    <body>


        <jsp:include page="cliente.jsp" />

        <div class="container">
            <br><br>
            <div>
                <a class="btn btn-success" style="cursor:pointer;" data-toggle="modal"
                    data-target="#exampleModal">Registrar mascota</a>
            </div>
            <br><br>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">Edad</th>
                        <th scope="col">Opciones</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <th scope="row">1</th>
                        <td>Peluchin</td>
                        <td>Perro</td>
                        <td>2</td>

                        <td>
                            <a class="btn btn-warning" href="">Modificar</a>
                            <a class="btn btn-danger" href="">Eliminar</a>
                        </td>
                    </tr>


                </tbody>
            </table>




            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Registro</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>

                                <div class="form-group">
                                    <label for="full_name_id" class="control-label">Nombre</label>
                                    <input type="text" class="form-control" name="nombre">
                                </div>

                                <div class="form-group">
                                    <label for="street1_id" class="control-label">Tipo</label>
                                    <input type="text" class="form-control" name="tipo">
                                </div>

                                <div class="form-group">
                                    <label for="street2_id" class="control-label">Raza</label>
                                    <input type="text" class="form-control" name="raza">
                                </div>

                                <div class="form-group">
                                    <label for="street2_id" class="control-label">Edad</label>
                                    <input type="text" class="form-control" name="edad">
                                </div>

                                <div class="form-group">
                                    <label for="street2_id" class="control-label">Peso</label>
                                    <input type="text" class="form-control" name="peso">
                                </div>
                                <button type="submit" class="btn btn-primary">Registrar mascota</button>
                                <button type="submit" class="btn btn-danger">Cancelar</button>
                            </form>

                        </div>
                    </div>
                </div>

            </div>


            <script>
                $('#exampleModal').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget)
                    var recipient = button.data('whatever')
                    var modal = $(this)

                })
            </script>
    </body>

    </html>
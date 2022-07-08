import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
        //pull_to_refresh: ^2.0.0

class UsuariosPage extends StatefulWidget {
  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

      RefreshController _refreshController =
      RefreshController(initialRefresh: false);


  final usuarios = [
    Usuario(uid: '123456', online: true, nombre: 'Maria', email: 'test1@test.com'),
    Usuario(uid: '123456', online: false, nombre: 'Melisas', email: 'test2@test.com'),
    Usuario(uid: '123456', online: true, nombre: 'Fernando', email: 'test3@test.com')
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mi nombre',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.wifi_off_sharp,
                color: Colors.red[700],
              )
              // Icon(Icons.check_circle, color: Colors.green,),
              )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _cargarUsuarios,
        child: _listViewUsuarios(),  
        // header: WaterDropHeader(
        //   complete: Icon(Icons.check, color: Colors.blue[400],),
        //   waterDropColor: Colors.blue, 
        // ),

        )
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_ , i) => _usuarioListTile(usuarios[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: usuarios.length);
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre!),
        subtitle: Text(usuario.email!),
        leading: CircleAvatar(
          backgroundColor:(usuario.online)
              ? Colors.blue[100]  
              : Colors.black12,
          child: Text(
            (usuario.nombre!.substring(0,2)),
          ),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: (usuario.online)
              ? Colors.green[600]  
              : Colors.black12,
              borderRadius: BorderRadius.circular(60)
          ),
        ),
      );
  }

  Future _cargarUsuarios() async{ // metodo q simula una espera, este no es necesario, es solo para probar
    // // aca se puede cargar la lista por ejemplo (no debe ir future ni await, esto es solo para ver el funcionamiento de pulltoRefresh)
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();

  }


}

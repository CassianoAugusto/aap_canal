import 'package:app_canal/canal/model/canal_model.dart';
import 'package:app_canal/canal/servicos/canal_servicos.dart';
import 'package:flutter/material.dart';

class CanalPage extends StatelessWidget {
  const CanalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CanalModel>>(
        future: ApiService.fetchShows(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum show encontrado'));
          } else {
            final shows = snapshot.data!;
            return ListView.builder(
              itemCount: shows.length,
              itemBuilder: (context, index) {
                final show = shows[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: SizedBox(
                      width: 50,
                      child: Image.network(show.imageUrl, fit: BoxFit.cover),
                    ),
                    title: Text(show.title),
                    subtitle: Text(
                      'Audiência: ${show.audienceScore ?? "-"} | Críticos: ${show.criticsScore}',
                    ),
                    trailing: show.isVideo
                        ? const Icon(Icons.play_circle_fill)
                        : null,
                    onTap: () {},
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

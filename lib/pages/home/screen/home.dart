import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_modal/pages/home/bloc/home_bloc.dart';
import 'package:sample_modal/pages/home/bloc/home_event.dart';
import 'package:sample_modal/pages/home/bloc/home_state.dart';
import 'package:sliding_panel/sliding_panel.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PanelController pc = PanelController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, state) {
      print('HomeScreen.BlocBuilder: $state');

      List items = [];
      if (state is HomeDataLoaded) {
        items = (state).items;
        print('HomeScreen.BlocBuilder: $items');
      }

      return SafeArea(
        child: Scaffold(
          body: Center(
            child: RaisedButton(
              child: Text('Home'),
              onPressed: () {
                showModalSlidingPanel(
                  context: context,
                  panel: (context) {
                    return SlidingPanel(
                      panelController: pc,
                      safeAreaConfig:
                          SafeAreaConfig.all(removePaddingFromContent: true),
                      backdropConfig: BackdropConfig(enabled: true),
                      isTwoStatePanel: true,
                      snapping: PanelSnapping.forced,
                      size: PanelSize(closedHeight: 0.00, expandedHeight: 0.8),
                      autoSizing: PanelAutoSizing(
                          autoSizeExpanded: true, headerSizeIsClosed: true),
                      duration: Duration(milliseconds: 500),
                      initialState: InitialPanelState.expanded,
                      //
                      content: PanelContent(
                        panelContent: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                child: ListTile(
                                  title: Text('Item : ${items[index]}'),
                                ),
                                onTap: () {
                                  print('ListView.itemBuilder.InkWell.onTap');
                                  BlocProvider.of<HomeBloc>(context)
                                      .add(ItemClicked(item: index));
                                },
                              );
                            },
                          ),
                        ],
                        headerWidget: PanelHeaderWidget(
                          headerContent: Text(
                            'Click items(${items.length}) to remove',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          options: PanelHeaderOptions(
                            centerTitle: true,
                            elevation: 4,
                            forceElevated: true,
                            primary: false,
                          ),
                          onTap: () => pc.currentState == PanelState.closed
                              ? pc.expand()
                              : pc.close(),
                          decoration:
                              PanelDecoration(padding: EdgeInsets.all(16)),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      );
    });
  }
}

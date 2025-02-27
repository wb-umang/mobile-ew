import 'dart:io';

import 'package:every_watch/core/common/entities/watch_detail_entity.dart';
import 'package:every_watch/core/common/widgets/custom_loader.dart';
import 'package:every_watch/core/common/widgets/screen_widget.dart';
import 'package:every_watch/core/common/widgets/search_bar/search_bar_widget.dart';
import 'package:every_watch/core/utils/show_custom_snackbar.dart';
import 'package:every_watch/features/home/data/models/watch_listing_filter_model.dart';
import 'package:every_watch/features/home/domain/enums/home_enums.dart';
import 'package:every_watch/features/home/ui/bloc/home_bloc.dart';
import 'package:every_watch/features/home/ui/pages/home_page/home_view_model.dart';
import 'package:every_watch/features/home/ui/widgets/filter_options_widget.dart';
import 'package:every_watch/features/home/ui/widgets/top_tab_home_widget.dart';
import 'package:every_watch/features/home/ui/widgets/watch_listing_view_widget.dart';
import 'package:every_watch/flutter_flow/flutter_flow_theme.dart';
import 'package:every_watch/flutter_flow/keep_alive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WatchDetailEntity> watchListing = [];
  bool isScreenLoading = false;
  TabType selectedTab = TabType.available;
  WatchListingFilterModel watchListingFilter =
      WatchListingFilterModel.defaultData();

  @override
  void initState() {
    super.initState();

    watchListingFilter = WatchListingFilterModel(
      sortType: SortType.asc.name,
      sortColumn: SortColumn.relevance.name,
      from: 0,
      size: 30,
      filterData: {
        "currencyMode": CurrencyMode.usd.name.toUpperCase(),
        "auctionType": [AuctionType.listing.name],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          HomeViewModel()..getWatchListing(context, watchListingFilter, true),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          context.read<HomeViewModel>().handleHomeState(state);
          if (state is HomeLoading) {
            setState(() {
              isScreenLoading = true;
            });
          }

          if (state is HomeSuccess) {
            setState(() {
              isScreenLoading = false;
              watchListing = state.watchListings;
            });
          }

          if (state is HomeError) {
            setState(() {
              isScreenLoading = false;
            });
            showCustomSnackBar(context, state.message);
          }
        },
        builder: (context, homeState) {
          return BlocBuilder<HomeViewModel, HomeState>(
            builder: (context, homeState) {
              if (homeState is HomeLoading && homeState.isScreenInitializing) {
                return Center(
                  child:
                      CustomLoader(color: FlutterFlowTheme.of(context).primary),
                );
              }

              return GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Scaffold(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  body: KeepAliveWidgetWrapper(
                    builder: (context) => Screen(
                      padding: EdgeInsets.only(
                        top: Platform.isAndroid ? 14 : 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                      ),
                      isLoading: false,
                      loaderColor: FlutterFlowTheme.of(context).primary,
                      child: Column(
                        children: [
                          // Fixed Header
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(18, 8, 18, 8),
                              child: Column(
                                children: [
                                  SearchBarWidget(
                                    searchLabel: 'Search Watch',
                                  ),
                                  SizedBox(height: 18),
                                  TopTabHomeWidget(
                                    selectedTab: selectedTab,
                                    onAvailableSelected: (tab) {
                                      context
                                          .read<HomeViewModel>()
                                          .getWatchListing(
                                              context,
                                              watchListingFilter
                                                  .copyWith(filterData: {
                                                "auctionType": [
                                                  AuctionType.listing.name
                                                ]
                                              }),
                                              false);
                                      setState(() {
                                        selectedTab = TabType.available;
                                      });
                                    },
                                    onHistoricalSelected: (tab) {
                                      context
                                          .read<HomeViewModel>()
                                          .getWatchListing(
                                              context,
                                              watchListingFilter
                                                  .copyWith(filterData: {
                                                "auctionType": [
                                                  AuctionType.historical.name
                                                ]
                                              }),
                                              false);
                                      setState(() {
                                        selectedTab = TabType.historical;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Expanded content to enable scrolling
                          Expanded(
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 14),
                                      child: Column(
                                        children: [
                                          FilterOptionsWidget(
                                            tabType: selectedTab,
                                            onMarketplaceSelected:
                                                (auctionType) {
                                              context
                                                  .read<HomeViewModel>()
                                                  .getWatchListing(
                                                      context,
                                                      watchListingFilter
                                                          .copyWith(
                                                              filterData: {
                                                            "auctionType": [
                                                              auctionType.name
                                                            ]
                                                          }),
                                                      false);
                                            },
                                            onMarketplaceUnselected: () {
                                              context
                                                  .read<HomeViewModel>()
                                                  .getWatchListing(
                                                      context,
                                                      watchListingFilter
                                                          .copyWith(
                                                              filterData: {
                                                            "auctionType": [
                                                              AuctionType
                                                                  .listing.name
                                                            ]
                                                          }),
                                                      false);
                                            },
                                            onSortSelected:
                                                (sortColumn, sortType) {
                                              context
                                                  .read<HomeViewModel>()
                                                  .getWatchListing(
                                                      context,
                                                      watchListingFilter
                                                          .copyWith(
                                                              sortColumn:
                                                                  sortColumn
                                                                      .name,
                                                              sortType:
                                                                  sortType.name,
                                                              filterData: {
                                                            "currencyMode":
                                                                CurrencyMode
                                                                    .usd.name
                                                                    .toUpperCase(),
                                                            "auctionType": [
                                                              selectedTab ==
                                                                      TabType
                                                                          .available
                                                                  ? AuctionType
                                                                      .listing
                                                                      .name
                                                                  : AuctionType
                                                                      .historical
                                                                      .name
                                                            ]
                                                          }),
                                                      false);
                                            },
                                          ),
                                          WatchListingView(
                                            watchListing: watchListing,
                                            tabType: selectedTab,
                                            isLoading: homeState is HomeLoading,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

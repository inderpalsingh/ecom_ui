
import 'package:ecom_ui/data/models/categories_model.dart';
import 'package:ecom_ui/presentation/screens/blocs/categories/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
    CategoriesModel? myData;

  @override
  void initState() {
    super.initState();
    // context.read<CategoriesBloc>().add(CategoriesAllEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CategoriesFailedState) {
            return Center(child: Text(state.errorMsg));
          }
          if (state is CategoriesSuccessState) {

            return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: state.categoriesModel.length,
                itemBuilder: (context, index) {
                  myData = state.categoriesModel[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            myData!.image.toString(),
                            height: 80,
                            width: 80,
                          ),
                        ),
                        Text(
                          state.categoriesModel[index].title,
                          style: const TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  );
                });
          }
          return const SizedBox();
        },
      ),
    );
  }
}

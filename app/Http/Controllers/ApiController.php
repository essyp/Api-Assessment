<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helpers\ApiCall;
use App\Helpers\ResponseHelper;
use Illuminate\Support\Facades\Validator;
use App\Book;

class ApiController extends Controller
{
    public function fetchApiBooks()
    {
        $data = ApiCall::get("https://www.anapioficeandfire.com/api/books");
        if ($data) {
            return ResponseHelper::responseDisplay(200, 'success', $data);
        }
        return ResponseHelper::responseDisplay(400, 'failed', $data);
    }

    public function fetchCrud()
    {
        $data = Book::orderBY('id','desc')->get();
        return ResponseHelper::responseDisplay(200, 'success', $data);
    }

    public function fetchCrudById($id)
    {
        $data = Book::where('id', $id)->first();
        return ResponseHelper::responseDisplay(200, 'success', $data);
    }

    public function createCrud(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'isbn' => ['required', 'unique:books'],
                'authors' => 'required',
                'number_of_pages' => 'required',
                'country' => 'required',
                'publisher' => 'required',
                'release_date' => 'required',
            ]
        );
        if ($validator->fails()) {
            return ResponseHelper::responseDisplay(400, $validator->messages()->first(), '');
        }
        $data = new Book();
        $data->name = $request->name;
        $data->isbn = $request->isbn;
        $data->authors = $request->authors;
        $data->country = $request->country;
        $data->number_of_pages = $request->number_of_pages;
        $data->publisher = $request->publisher;
        $data->release_date = $request->release_date;
        if($data->save()){
            return ResponseHelper::responseDisplay(200, 'success', $data);
        }
        return ResponseHelper::responseDisplay(400, 'failed', $data);
    }

    public function updateCrud(Request $request, $id)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'name' => 'required',
                'isbn' => 'required',
                'authors' => 'required',
                'number_of_pages' => 'required',
                'country' => 'required',
                'publisher' => 'required',
                'release_date' => 'required',
            ]
        );
        if ($validator->fails()) {
            return ResponseHelper::responseDisplay(400, $validator->messages()->first(), '');
        }
        $data = Book::where('id', $id)->first();
        $data->name = $request->name;
        $data->isbn = $request->isbn;
        $data->authors = $request->authors;
        $data->country = $request->country;
        $data->number_of_pages = $request->number_of_pages;
        $data->publisher = $request->publisher;
        $data->release_date = $request->release_date;
        if($data->save()){
            return ResponseHelper::responseDelete(200, 'success', 'The book '.$data->name.' was updated successfully', $data);
        }
        return ResponseHelper::responseDelete(400, 'failed', 'Failed to update', $data);
    }

    public function deleteCrud($id)
    {
        $get = Book::where('id', $id)->first();
        $data = Book::where('id', $id)->delete();
        $data = Book::where('id', $id)->get();
        return ResponseHelper::responseDelete(200, 'success', 'The book '.$get->name.' was deleted successfully', $data);
    }
}

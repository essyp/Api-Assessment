<template>
    <div class="container">
        <div class="row justify-content-center">
            <!-- Begin Page Content -->
    <div class="container-fluid">

      <!-- Page Heading -->
      <h1 class="h3 mb-2 text-gray-800">CRUD</h1>
      <p class="mb-4">Data fetched from the local database.</p>
      

      <!-- DataTales Example -->
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Crud Project</h6>
            <button style="float:right" class="btn btn-primary" type="button" data-toggle="modal" data-target="#create">Add New Book</button>
        </div>
        <div class="card-body" v-if="books.length > 0"> 
          <div class="table-responsive">
              <input style="width: 200px; float: right" v-model="searchBooks" placeholder="Search" class="form-control" type="text"/><br><br>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th><input type="checkbox" @click="checkAll()" id="chAllCon" /></th>
                  <th>Nos</th>
                  <th>Name</th>
                  <th>ISBN</th>
                  <th>Authors</th>
                  <th>No of Pages</th>
                  <th>Publisher</th>
                  <th>Country</th>
                  <th>Released Date</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(book, index) in searchResult" :key="book.id">
                  <td><input class="chBox" type="checkbox" :value="book.id" name="id[]" /> </td>
                  <td>{{index + 1}}</td>
                  <td>{{book.name}}</td>
                  <td>{{book.isbn}}</td>
                  <td>{{book.authors}}</td>
                  <td>{{book.number_of_pages}}</td>
                  <td>{{book.publisher}}</td>
                  <td>{{book.country}}</td>
                  <td>{{book.release_date}}</td>
                  <td>
                    <a @click="viewData(index)" href="javascript:void(0);" style="color: blue" data-toggle="modal" data-target="#view" ><i class="fas fa-fw fa-eye" style="color:green"></i></a>
                    <a @click="viewData(index)" href="javascript:void(0);" style="color: blue" data-toggle="modal" data-target="#update" ><i class="fas fa-fw fa-edit"></i></a>
                    <a @click="viewData(index)" href="javascript:void(0);" style="color: blue" data-toggle="modal" data-target="#delete" ><i class="fas fa-fw fa-trash" style="color:red"></i></a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <div class="card-body" v-else> 
             <p>Empty Data</p>
        </div>
      </div>

    </div>
    <!-- /.container-fluid -->


    <!-- view modal-->
<div id="view" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="fullWidthModalLabel">{{viewBook.name}} - {{viewBook.isbn}}</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <form class="pl-3 pr-3">
                    <div class="form-group">
                        <label>Name</label>
                        <input class="form-control" type="text" v-model="viewBook.name" name="name" readonly>
                    </div>
                    <div class="form-group">
                        <label>ISBN</label>
                        <input class="form-control" type="text" v-model="viewBook.isbn" name="isbn" readonly>
                    </div>
                    <div class="form-group">
                        <label>Authors</label>
                        <input class="form-control" type="text" v-model="viewBook.authors" name="authors" readonly>
                    </div>
                    <div class="form-group">
                        <label>Number of Pages</label>
                        <input class="form-control" type="text" v-model="viewBook.number_of_pages" name="number_of_pages" readonly>
                    </div>
                    <div class="form-group">
                        <label>Publisher</label>
                        <input class="form-control" type="text" v-model="viewBook.publisher" name="publisher" readonly>
                    </div>
                    <div class="form-group">
                        <label>Country</label>
                        <input class="form-control" type="text" v-model="viewBook.country" name="country" readonly>
                    </div>
                    <div class="form-group">
                        <label>Released Date</label>
                        <input class="form-control" type="text" v-model="viewBook.release_date" name="release_date" readonly>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- create modal-->
<div id="create" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="fullWidthModalLabel">Add a New Book</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <form class="pl-3 pr-3">
                    <div class="form-group">
                        <label>Name</label>
                        <input class="form-control" type="text" v-model="viewBook.name" name="name">
                    </div>
                    <div class="form-group">
                        <label>ISBN</label>
                        <input class="form-control" type="text" v-model="viewBook.isbn" name="isbn">
                    </div>
                    <div class="form-group">
                        <label>Authors</label>
                        <input class="form-control" type="text" v-model="viewBook.authors" name="authors">
                    </div>
                    <div class="form-group">
                        <label>Number of Pages</label>
                        <input class="form-control" type="text" v-model="viewBook.number_of_pages" name="number_of_pages">
                    </div>
                    <div class="form-group">
                        <label>Publisher</label>
                        <input class="form-control" type="text" v-model="viewBook.publisher" name="publisher">
                    </div>
                    <div class="form-group">
                        <label>Country</label>
                        <input class="form-control" type="text" v-model="viewBook.country" name="country">
                    </div>
                    <div class="form-group">
                        <label>Released Date</label>
                        <input class="form-control" type="date" v-model="viewBook.release_date" name="release_date">
                    </div>
                    <div class="form-group text-center">
                        <button class="btn btn-primary" type="button" @click="createBook()">Create</button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- update modal-->
<div id="update" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="fullWidthModalLabel">{{viewBook.name}} - {{viewBook.isbn}}</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <form class="pl-3 pr-3">
                    <div class="form-group">
                        <label>Name</label>
                        <input class="form-control" type="text" v-model="viewBook.name" name="name">
                    </div>
                    <div class="form-group">
                        <label>ISBN</label>
                        <input class="form-control" type="text" v-model="viewBook.isbn" name="isbn">
                    </div>
                    <div class="form-group">
                        <label>Authors</label>
                        <input class="form-control" type="text" v-model="viewBook.authors" name="authors">
                    </div>
                    <div class="form-group">
                        <label>Number of Pages</label>
                        <input class="form-control" type="text" v-model="viewBook.number_of_pages" name="number_of_pages">
                    </div>
                    <div class="form-group">
                        <label>Publisher</label>
                        <input class="form-control" type="text" v-model="viewBook.publisher" name="publisher">
                    </div>
                    <div class="form-group">
                        <label>Country</label>
                        <input class="form-control" type="text" v-model="viewBook.country" name="country">
                    </div>
                    <div class="form-group">
                        <label>Released Date</label>
                        <input class="form-control" type="date" v-model="viewBook.release_date" name="release_date">
                    </div>
                    <div class="form-group text-center">
                        <input class="form-control" type="hidden" v-model="viewBook.id" name="id">
                        <button class="btn btn-primary" type="button" @click="updateBook(viewBook.id)">Update</button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- Delete Modal-->
  <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">{{viewBook.name}} - {{viewBook.isbn}}</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Are you sure you want to delete this item?.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-danger" href="javascript:void(0);" @click="deleteBook(viewBook.id)">Confirm</a>
        </div>
      </div>
    </div>
  </div>


        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                books:[],
                viewBook:{
                  name:'',
                  isbn:'',
                  authors:'',
                  number_of_pages:'',
                  publisher:'',
                  country:'',
                  release_date:'',
                  id:'',
                },
                searchBooks: null,
            }
        },

        mounted() {
            console.log('Component mounted.')
        },

        created() {
            this.fetchBooks();
        },

        methods: {
            fetchBooks () {
                axios(this.Url + '/api/v1/books').then(response =>{
                    if (! response.data == 200) {
                        return this.errorMessage = 'Could not fetch books';
                    }
                    this.books = response.data.data;
                }).catch(error => { });
            },

            createBook (event) {
                open_loader('#page');
                  axios.post(this.Url + '/api/v1/books/', this.viewBook)
                .then((response) => {
                if (response.data.status_code == 200) {
                    $('#create').modal('hide');
                    toastr.success(response.data.status);
                    this.fetchBooks();
                    window.setTimeout(function(){location.reload();},2000);
                    close_loader('#page');
                }
                }).catch((error) =>{
                    toastr.error(error.response.data.status);
                    close_loader('#page');
                })
            },

            updateBook (event) {
                open_loader('#page');
                  axios.patch(this.Url + '/api/v1/books/' + event, this.viewBook)
                .then((response) => {
                if (response.data.status_code == 200) {
                    $('#update').modal('hide');
                    toastr.success(response.data.message);
                    this.fetchBooks();
                    window.setTimeout(function(){location.reload();},2000);
                    close_loader('#page');
                }
                }).catch((error) =>{
                    toastr.error(error.response.data.status);
                    close_loader('#page');
                })
            },

            deleteBook (event) {
                open_loader('#page');
                  axios.delete(this.Url + '/api/v1/books/' + event)
                .then((response) => {
                if (response.data.status_code == 200) {
                    $('#delete').modal('hide');
                    toastr.success(response.data.message);
                    this.fetchBooks();
                    window.setTimeout(function(){location.reload();},2000);
                    close_loader('#page');
                }
                }).catch((error) =>{
                    toastr.error(error.response.data.status);
                    close_loader('#page');
                })
            },

            checkAll(){
                var ch =document.getElementById('chAllCon').checked,
                checked = false;
                if(ch){
                    checked=true;
                }
                var els = document.getElementsByClassName('chBox');

                for(var g=0;g<els.length;g++){
                    els[g].checked=checked;
                }
            },

            viewData  (index) {
                this.viewBook = this.books[index];
            },
        },

        computed: {
            Url: function () {
                return window.baseURL;
            },

            searchResult () {
                if(this.searchBooks){
                    return this.books.filter((item)=>{
                    return this.searchBooks.toLowerCase().split(' ').every(v => item.name.toLowerCase().includes(v))
                    || this.searchBooks.toLowerCase().split(' ').every(v => item.isbn.toLowerCase().includes(v))
                    || this.searchBooks.toLowerCase().split(' ').every(v => item.country.toLowerCase().includes(v))
                    || this.searchBooks.toLowerCase().split(' ').every(v => item.publisher.toLowerCase().includes(v))
                    || this.searchBooks.toLowerCase().split(' ').every(v => item.authors.toLowerCase().includes(v))
                    || this.searchBooks.toLowerCase().split(' ').every(v => item.release_date.toLowerCase().includes(v))
                    })
                }else{
                   return this.books;
                }
            },
        },
    }
</script>

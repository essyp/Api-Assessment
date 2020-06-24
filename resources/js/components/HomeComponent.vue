<template>
    <div class="container">
        <div class="row justify-content-center">
            <!-- Begin Page Content -->
    <div class="container-fluid">

      <!-- Page Heading -->
      <h1 class="h3 mb-2 text-gray-800">Books</h1>
      <p class="mb-4">Data fetched from the <a target="_blank" href="https://www.anapioficeandfire.com/api/books">Api Document given</a>.</p>

      <!-- DataTales Example -->
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Books</h6>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <input style="width: 200px; float: right" v-model="searchBooks" placeholder="Search" class="form-control" type="text"/><br><br>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Nos</th>
                  <th>Name</th>
                  <th>ISBN</th>
                  <th>Authors</th>
                  <!-- <th>Url</th>
                  <th>No of Pages</th> -->
                  <th>Publisher</th>
                  <th>Country</th>
                  <!-- <th>Media Type</th> -->
                  <th>Released Date</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(book, index) in searchResult" :key="index">
                  <td>{{index + 1}}</td>
                  <td>{{book.name}}</td>
                  <td>{{book.isbn}}</td>
                  <td>{{book.authors[0]}}</td>
                  <!-- <td>{{book.url}}</td>
                  <td>{{book.numberOfPages}}</td> -->
                  <td>{{book.publisher}}</td>
                  <td>{{book.country}}</td>
                  <!-- <td>{{book.mediaType}}</td> -->
                  <td>{{book.released}}</td>
                  <td>
                    <a @click="viewData(index)" href="javascript:void(0);" style="color: blue" data-toggle="modal" data-target="#view" ><i class="fas fa-fw fa-eye" style="color:green"></i></a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

    </div>
    <!-- /.container-fluid -->



    <!-- view modal-->
<div v-if="viewBook.released" id="view" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="fullWidthModalLabel">{{viewBook.name}}</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <form class="pl-3 pr-3">
                    <div class="form-group">
                        <label>Name</label>
                        <input class="form-control" type="text" v-model="viewBook.name" readonly>
                    </div>
                    <div class="form-group">
                        <label>ISBN</label>
                        <input class="form-control" type="text" v-model="viewBook.isbn" readonly>
                    </div>
                    <div class="form-group">
                        <label>Authors</label>
                        <input class="form-control" type="text" v-model="viewBook.authors" readonly>
                    </div>
                    <div class="form-group">
                        <label>Url</label>
                        <input class="form-control" type="text" v-model="viewBook.url" readonly>
                    </div>
                    <div class="form-group">
                        <label>Number of Pages</label>
                        <input class="form-control" type="text" v-model="viewBook.numberOfPages" readonly>
                    </div>
                    <div class="form-group">
                        <label>Publisher</label>
                        <input class="form-control" type="text" v-model="viewBook.publisher" readonly>
                    </div>
                    <div class="form-group">
                        <label>Country</label>
                        <input class="form-control" type="text" v-model="viewBook.country" readonly>
                    </div>
                    <div class="form-group">
                        <label>Media Type</label>
                        <input class="form-control" type="text" v-model="viewBook.mediaType" readonly>
                    </div>
                    <div class="form-group">
                        <label>Released Date</label>
                        <input class="form-control" type="text" v-model="viewBook.released" readonly>
                    </div><br>
                    <div class="form-group">
                        <label><strong>Characters</strong></label>
                        <p v-for="(item, index) in viewBook.characters" :key="index">{{item}}</p>
                    </div><br>
                    <div class="form-group">
                        <label><strong>POV Characters</strong></label>
                        <p v-for="(item, index) in viewBook.povCharacters" :key="index">{{item}}</p>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                books:[],
                searchBooks: null,
                viewBook:{},
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
                axios(this.Url + '/api/external-books/').then(response =>{
                    if (! response.data == 200) {
                        return this.errorMessage = 'Could not fetch books';
                    }
                    this.books = response.data.data;
                }).catch(error => { });
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
                    || this.searchBooks.toLowerCase().split(' ').every(v => item.authors[0].toLowerCase().includes(v))
                    || this.searchBooks.toLowerCase().split(' ').every(v => item.released.toLowerCase().includes(v))
                    || this.searchBooks.toLowerCase().split(' ').every(v => item.mediaType.toLowerCase().includes(v))
                    })
                }else{
                   return this.books;
                }
            },
        },
    }
</script>

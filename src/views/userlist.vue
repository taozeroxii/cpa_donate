<template>
  <v-container id="userlist">
    <!-- Table section -->
    <v-card style="margin:15px">
      <v-data-table :search="search" :headers="headers" :items="mDataArray" :loading="loaddata" loading-text="Loading... Please wait">
        <!-- table top section -->
        <template v-slot:top>
          <v-toolbar flat color="white">
            <v-toolbar-title>ผู้ใช้งาน</v-toolbar-title>
            <v-divider class="mx-4" inset vertical></v-divider>
            <v-text-field
              v-model="search"
              append-icon="search"
              label="Search"
              single-line
              hide-details
            ></v-text-field>
            <v-spacer></v-spacer>
            <v-btn
              @click="$router.push('/register')"
              color="primary"
              dark
              class="mb-2"
            >
              <v-icon left>add</v-icon>
              <span>เพิ่มผู้ใช้งาน</span>
            </v-btn>
          </v-toolbar>
        </template>

        <!-- table tr section -->
        <template v-slot:item="{ item }">
          <tr>
            <td>{{ item.id }}</td>
            <td>{{ item.pname }}</td>
            <td>{{ item.fname }}</td>
            <td>{{ item.lname }}</td>
            <td>{{ item.username }}</td>
            <td>{{ item.role }}</td>
            <!-- <td>{{ item.price | currency("฿") }}</td>
            <td>{{ item.stock | number("0,0") }} pcs.</td> -->
            <td>
              <v-icon class="mr-2" @click="editItem(item)">
                edit
              </v-icon>
              <span class="ma-1"></span>
              <v-icon @click="deleteItem(item)">
                delete
              </v-icon>
            </td>
          </tr>
        </template>
      </v-data-table>

      <v-dialog v-model="confirmDeleteDlg" max-width="290">
        <v-card>
          <v-card-title primary-title>
            Confirm Delete
          </v-card-title>

          <v-card-text class="body">
            ต้องการลบ user Account นี้หรือไม่ ? 
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn text @click="confirmDeleteDlg = false">
              ยกเลิก
            </v-btn>

            <v-btn color="error" text @click="confirmDelete">
              ยืนยัน
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-card>
  </v-container>
</template>

<script>
import axios from 'axios'
export default {
  name: "userlist",
  data() {
    return {
      search: "",
      selectedUserId: "",
      confirmDeleteDlg: false,
      loaddata:true,
      mDataArray: [],
      headers: [
        {
          text: "Id",
          align: "left",
          sortable: false,
          value: "id",
        },
        { text: "คำนำหน้า", value: "pname" },
        { text: "ชื่อ", value: "fname" },
        { text: "สกุล", value: "lname" },
        { text: "username", value: "username" },
        { text: "default_สิทธิ", value: "default_role" },
        { text: "Action", value: "action" },
      ],
    };
  },


  methods: {
    editItem(item) {
        this.$router.push(`/edit-user/${item.id}`);
    },
    deleteItem(item) {
        this.selectedUserId = item.id;
        this.confirmDeleteDlg = true;
        console.log('เลือกลบ id: ' +this.selectedUserId )
    },
    async confirmDelete() {
        // console.log(this.selectedUserId)
        await axios.delete(`api/account/delete-user/${this.selectedUserId}`);
        this.confirmDeleteDlg = false;
        this.loadUser();
    },
    async loadUser() {
        await axios.get(`api/account/getuserlist` ).then((result) => {this.mDataArray = result.data;  });
        this.loaddata = false;
    },
  },


  mounted() {
    this.loadUser();
  }
};
</script>

<style></style>

<template>
  <v-container id="userlist">
    <!-- Table section -->
    <v-card style="margin:15px">
      <v-data-table :search="search" :headers="headers" :items="mDataArray" :loading="loaddata" loading-text="Loading... Please wait">
        <!-- table top section -->
        <template v-slot:top>
          <v-toolbar flat color="white">
            <v-toolbar-title>รายชื่อผู้รับบริจาค</v-toolbar-title>
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
              @click="$router.push('/Add-Donor')"
              color="primary"
              dark
              class="mb-2"
            >
              <v-icon left>add</v-icon>
              <span>เพิ่มผู้รับบริจาค</span>
            </v-btn>
          </v-toolbar>
        </template>

        <!-- table tr section -->
        <template v-slot:item="{ item }">
          <tr>
            <td>{{ item.donor_id }}</td>
            <td>{{ item.donor_name }}</td>
            <td>{{ item.insertby }}</td>
            <td>{{ item.insertdate_time | date}}</td>
            <td>
              <v-icon class="mr-2" @click="editItem(item)">
                edit
              </v-icon>
              <span class="ma-1"></span>
              <!-- <v-icon  @click="deleteItem(item)">
                delete
              </v-icon> -->
            </td>
          </tr>
        </template>
      </v-data-table>

      <!-- <v-dialog v-model="confirmDeleteDlg" max-width="290">
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
      </v-dialog> -->
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
      checkstatus:true,
      selectedUserId: "",
      confirmDeleteDlg: false,
      loaddata:true,
      mDataArray: [],
      headers: [
        {
          text: "donor_id",
          align: "left",
          sortable: false,
          value: "id",
        },
        { text: "donor_name", value: "donor_id" },
        { text: "insertby", value: "donor_name" },
        { text: "insertdate_time", value: "insertby" },
        { text: "action", value: "insertdate_time" },
      ],
    };
  },


  methods: {
    editItem(item) {
        this.$router.push(`/edit-donor/${item.donor_id}`);
    },
    deleteItem(item) {
        if(this.$store.state.user.default_role_name =='admin'){
        this.selectedUserId = item.id;
        this.confirmDeleteDlg = true;
        console.log('เลือกลบ id: ' +this.selectedUserId )
        }
    },
    async confirmDelete() {
        // console.log(this.selectedUserId)
        // await axios.delete(`api/account/delete-user/${this.selectedUserId}`);
        // this.confirmDeleteDlg = false;
        // this.loadDonor();
    },
    async loadDonor() {
        await axios.get(`api/donate/donorlist` ).then((result) => {this.mDataArray = result.data;  });
        this.loaddata = false;
    },
  },


  mounted() {
    this.loadDonor();
  }
};
</script>

<style></style>

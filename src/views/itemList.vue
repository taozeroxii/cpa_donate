<template>
  <v-container id="itemlist">
    <!-- Table section -->
    <v-card style="margin:15px">
      <v-data-table :search="search" :headers="headers" :items="mDataArray"  :loading="loaddata" loading-text="Loading... Please wait" :footer-props="{'items-per-page-options': [10, 20, 30, 40, 50]}" >
        <!-- table top section -->
        <template v-slot:top>
          <v-toolbar flat color="white">
            <v-toolbar-title>ข้อมูลสินค้าทั้งหมด</v-toolbar-title>
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
              @click="$router.push('/add-item')"
              color="primary"
              dark
              class="mb-2"
            >
              <v-icon left>add</v-icon>
              <span>เพิ่มรายการสินค้า</span>
            </v-btn>
          </v-toolbar>
        </template>

        <!-- table tr section -->
        <template v-slot:item="{ item }">
          <tr>
            <td>{{ item.item_id }}</td>
            <td>{{ item.item_name }}</td>
            <td>{{ item.item_name_type }}</td>
            <td>{{ item.group_type }}</td>
            <td>{{ item.insert_date  }}</td>
            <td>{{ item.update_date }}</td>
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
  name: "itemlist",
  components:{
    
  },

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
          value: "item_id",
        },
        { text: "ชื่อรายการ", value: "item_name" },
        { text: "หน่วยนับ", value: "item_name_type" },
        { text: "ที่จัดเก็บ", value: "group_type" },
        { text: "วันที่เพิ่ม", value: "insert_date" },
        { text: "วันที่แก้ไขล่าสุด", value: "update_date" },
        { text: "Action", value: "action" },
      ],

    };
  },


  methods: {
    editItem(item) {
      console.log(item.item_id);
      // this.$router.push(`/edit-item/${item.item_id}`);
    },
    deleteItem(item) {
        this.selectedUserId = item.id;
        this.confirmDeleteDlg = true;
        console.log('เลือกลบ id: ' +this.selectedUserId )
    },
    async confirmDelete() {
        // console.log(this.selectedUserId)
        // await axios.delete(`api/account/delete-donatein/${this.selectedUserId}`);
        // this.confirmDeleteDlg = false;
        // this.loadItemlist();
    },
    async loadItemlist() {
        await axios.get(`api/donate/itemlist` ).then((result) => {this.mDataArray = result.data;  });
        this.loaddata = false;
    },
  },

  mounted() {
      this.loadItemlist();
  },
};
</script>

<style></style>

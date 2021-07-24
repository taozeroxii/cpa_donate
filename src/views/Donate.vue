<template>
  <v-container id="donate">
    <!-- Table section -->
    <v-card style="margin:15px">
      <v-data-table :search="search" :headers="headers" :items="mDataArray" :loading="loaddata" loading-text="Loading... Please wait" :footer-props="{'items-per-page-options': [10, 20, 30, 40, 50]}">
        <!-- table top section -->
        <template v-slot:top>
          <v-toolbar flat color="white">
            <v-toolbar-title>ข้อมูลรับบริจาคทั้งหมด</v-toolbar-title>
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
              @click="$router.push('/add-donate')"
              color="primary"
              dark
              class="mb-2"
            >
              <v-icon left>add</v-icon>
              <span>เพิ่มข้อมูลรับบริจาค</span>
            </v-btn>
          </v-toolbar>
        </template>

        <!-- table tr section -->
        <template v-slot:item="{ item }">
          <tr>
            <td>{{ item.donate_head_id }}</td>
            <td>{{ item.donate_id }}</td>
            <td>{{ item.donor }}</td>
            <td>{{ item.item_name }}</td>
            <td>{{ item.amount  | number('0,0') }}</td>
            <td>{{ item.item_name_type }}</td>
            <td>{{ item.type_name }}</td>
            <td>{{ item.insert_date | date }}</td>
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
            <!-- ต้องการลบ ข้อมูลนี้หรือไม่ ?  -->
            ยังไม่เปิดใช้งาน
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn text @click="confirmDeleteDlg = false">
              ยกเลิก
            </v-btn>
<!-- 
            <v-btn color="error" text @click="confirmDelete">
              ยืนยัน
            </v-btn> -->
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-card>
  </v-container>
</template>

<script>
import axios from 'axios'

export default {
  name: "donate",
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
        { text: "เลขที่รับบริจาค", value: "donate_head_id" },
        { text: "Id", align: "left",  sortable: false, value: "donate_id", },
        { text: "ผู้บริจาค", value: "donor" },
        { text: "ชื่อสินค้า", value: "item_name" },
        { text: "จำนวน", value: "amount" },
        { text: "หน่วย", value: "item_name_type" },
        { text: "คลัง", value: "type_name" },
        { text: "วันที่เพิ่มข้อมูล", value: "insert_date" },
        { text: "Action", value: "action" },
      ],
    };
  },


  methods: {
    editItem() {
        // this.$router.push(`/edit-donatein/${item.id}`);
    },
    deleteItem(item) {
        this.selectedUserId = item.donate_id;
        this.confirmDeleteDlg = true;
        console.log('เลือกลบ id: ' +this.selectedUserId )
    },
    async confirmDelete() {
        // console.log(this.selectedUserId)
        // await axios.delete(`api/donate/delete-donatein/${this.selectedUserId}`);
        // this.confirmDeleteDlg = false;
        // this.loadDonateList();
    },
    async loadDonateList() {
        await axios.get(`api/donate/donatelist` ).then((result) => {this.mDataArray = result.data;  });
        this.loaddata=false;
    },
  },

  mounted() {
      this.loadDonateList();
  },
};
</script>

<style></style>

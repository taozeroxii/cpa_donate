<template>
  <div dir="wDraw">
    
    <v-container id="donate">
      <!-- Table section -->
      <v-card style="margin:15px">
        <v-data-table
          :search="search"
          :headers="headers"
          :items="mDataArray"
          :loading="loaddata"
          loading-text="Loading... Please wait"
          :footer-props="{ 'items-per-page-options': [10, 20, 30, 40, 50] }"
        >
          <!-- table top section -->
          <template v-slot:top>
            <v-toolbar flat color="white">
              <v-toolbar-title>ข้อมูลจ่ายสินค้า</v-toolbar-title>
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
                @click="$router.push('/w-draw')"
                color="primary"
                dark
                class="mb-2"
              >
                <v-icon left>add</v-icon>
                <span>เพิ่มรายการจ่ายสิ่งของ</span>
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
              <td>{{ item.amount | number("0,0") }}</td>
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
              ต้องการลบ ข้อมูลนี้หรือไม่ ?
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
  </div>
</template>

<script>
export default {
  name: "wDraw",
};
</script>

<style></style>
